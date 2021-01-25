'use strict';

module.exports = (app) => {
  const { STRING, DATE } = app.Sequelize;

  const News = app.model.define('news', {
    title: STRING,
    content: STRING,
    type: STRING,
    ip: STRING,
    created_at: DATE, // 关闭createdAt
    updated_at: DATE, // 开启updatedAt
  });

  return News;
};
