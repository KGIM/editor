'use strict';

const fs = require('mz/fs');
const path = require('path');

const Controller = require('egg').Controller;

class HomeController extends Controller {
  async index() {
    const { ctx } = this;
    ctx.body = 'hi, egg';
  }

  async getData() {
    const { type, page, search_value } = this.ctx.query;
    let result = null;
    let totalLen = null;
    // 根据类型查询新闻
    if (type) {
      // 有搜索内容
      if (search_value) {
        result = await this.ctx.model.query(
          'select * from news where type=:type and content like BINARY :search_value LIMIT :page,10	',
          {
            replacements: {
              type: type,
              search_value: '%' + search_value + '%',
              page: (parseInt(page) - 1) * 10,
            },
          }
        );
        totalLen = await this.ctx.model.query(
          'select count(*) from news where type=:type and content like BINARY :search_value',
          {
            replacements: {
              type: type,
              search_value: '%' + search_value + '%',
            },
          }
        );
      } else {
        result = await this.ctx.model.query(
          'select * from news where type=:type limit :page, 10',
          {
            replacements: {
              type: type,
              page: (parseInt(page) - 1) * 10,
            },
          }
        );
        totalLen = await this.ctx.model.query(
          'select count(*) from news where type=:type',
          {
            replacements: {
              type: type,
            },
          }
        );
      }
    }
    // 查询所有新闻
    else {
      if (search_value) {
        result = await this.ctx.model.query(
          'select * from news where content like :search_value limit :page, 10',
          {
            replacements: {
              search_value: '%' + search_value + '%',
              page: (parseInt(page) - 1) * 10,
            },
          }
        );
        totalLen = await this.ctx.model.query(
          'select count(*) from news where content like :search_value',
          {
            replacements: {
              search_value: '%' + search_value + '%',
              page: (parseInt(page) - 1) * 10,
            },
          }
        );
      } else {
        // 返回的是一个数组
        result = await this.ctx.model.query(
          'select * from news limit :page, 10',
          {
            replacements: {
              page: (parseInt(page) - 1) * 10,
            },
          }
        );
        // 会返回一个数组，数组里面嵌套着数组
        totalLen = await this.ctx.model.query('select count(*) from news');
      }
    }
    this.ctx.body = [result[0], totalLen[0][0]];
  }

  async save() {
    const { newsItem, imgArr } = this.ctx.request.body;
    const id = newsItem.id;
    // const ip = this.ctx.request.ip;
    // 获取nginx转发的真实ip
    const ip =
      'http://' +
      this.ctx.headers['x-real-ip'] +
      ':' +
      this.ctx.headers['x-real-port'];
    if (id) {
      await this.ctx.model.query(
        'update news set content=:content, type=:type, title=:title, ip=:ip where id=:id',
        {
          replacements: {
            content: newsItem.content,
            type: newsItem.type,
            title: newsItem.title,
            ip: ip,
            id: id,
          },
        }
      );
    } else {
      await this.ctx.model.query(
        'insert into news (content, type, title, ip) values (:content, :type, :title, :ip)',
        {
          replacements: {
            content: newsItem.content,
            type: newsItem.type,
            title: newsItem.title,
            ip: ip,
          },
        }
      );
    }
    if (imgArr) {
      if (imgArr.length != 0) {
        imgArr.forEach((element) => {
          fs.unlink(path.join(path.resolve(), `/app/public/${element}`));
        });
      }
    }
    this.ctx.body = 'ok';
  }

  async getDetail() {
    const { id } = this.ctx.query;
    const result = await this.ctx.model.query(
      'select * from news where id=:id',
      {
        replacements: {
          id: id,
        },
      }
    );
    const dir = path.join(path.resolve(), 'app/public');
    let arr = fs.readdirSync(dir, (err) => {
      console.log(err);
    });
    const imgArr = arr.filter((element) => {
      return element.indexOf(id) != -1;
    });
    if (imgArr.length != 0) {
      this.ctx.body = [result[0][0], imgArr];
    } else {
      this.ctx.body = [result[0][0], []];
    }
  }

  async upload() {
    const { ctx } = this;
    // const { id } = ctx.query;
    const fileList = ctx.request.files;
    let finalImgPath = [];
    for (let file of fileList) {
      // path.resolve()拿到的绝对路径的是egg项目的一个文件夹
      const target = path.join(
        path.resolve(),
        // `/app/public/${id}-${file.filename}`
        `/app/public/${file.filename}`
      );
      let filePath = fs.readFileSync(file.filepath);
      fs.writeFileSync(target, filePath);
      // finalImgPath = [...finalImgPath, `/api/public/${id}-${file.filename}`];
      finalImgPath = [...finalImgPath, `/api/public/${file.filename}`];
    }
    ctx.body = finalImgPath;
  }

  async firstSave() {
    const { newsItem } = this.ctx.request.body;
    const ip =
      'http://' +
      this.ctx.headers['x-real-ip'] +
      ':' +
      this.ctx.headers['x-real-port'];
    await this.ctx.model.query(
      'insert into news (type, ip) values (:type, :ip)',
      {
        replacements: {
          type: newsItem.type,
          ip: ip,
        },
      }
    );
    const result = await this.ctx.model.query(' SELECT LAST_INSERT_ID()');
    // console.log(result[0][0]);
    this.ctx.body = result[0][0];
  }

  // 删除图片的操作，一个情况是已存在的变量的删除，那么就是说只要删除传进来的数组里面的图片即可，另外一种是新增的内容除了删除图片还需要删除记录根据数据库里面的文本内容判断是否删除记录
  async deleteImg() {
    const { imgArr } = this.ctx.request.body;
    const { id } = this.ctx.query;
    if (id) {
      const contentResult = await this.ctx.model.query(
        'select content from news where id=:id',
        {
          replacements: { id: id },
        }
      );
      // 根据文本内容过滤掉原本的图片以及是否要删除预存入的一个数据
      const content = contentResult[0][0].content;
      // 如果当前没有内容的话就删除因为是新增的，如果有说明是已有的那么就不进行操作
      if (!content) {
        await this.ctx.model.query('delete from news where id=:id', {
          replacements: {
            id: id,
          },
        });
      }
    }
    if (imgArr) {
      if (imgArr.length != 0) {
        imgArr.forEach((element) => {
          const index = element.lastIndexOf('/');
          const imgPath = element.slice(index + 1);
          fs.unlink(path.join(path.resolve(), `/app/public/${imgPath}`));
        });
      }
    }
    this.ctx.body = 'ok';
  }

  // 防止数据库图片上传带来的空数据
  async deleteRecord() {
    const { id } = this.ctx.query;
    await this.ctx.model.query('delete from news where id=:id', {
      replacements: {
        id: id,
      },
    });
    this.ctx.status = 200;
  }
}

module.exports = HomeController;
