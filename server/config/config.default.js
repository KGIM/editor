/* eslint valid-jsdoc: "off" */

'use strict';

/**
 * @param {Egg.EggAppInfo} appInfo app info
 */
module.exports = (appInfo) => {
  /**
   * built-in config
   * @type {Egg.EggAppConfig}
   **/
  const config = (exports = {});

  // use for cookie sign key, should change to your own and keep security
  config.keys = appInfo.name + '_1610069271506_5080';

  // add your middleware config here
  config.middleware = [];

  // add your user config here
  const userConfig = {
    // myAppName: 'egg',
  };

  config.sequelize = {
    dialect: 'mysql',
    host: '127.0.0.1',
    name: 'root',
    password: 'root',
    port: 3306,
    database: 'newsapp',
    timezone: '+08:00',
    dialectOptions: {
      dateStrings: true,
    },
  };

  config.security = {
    csrf: {
      enable: false,
      ignoreJSON: true,
    },
    domainWhiteList: ['http://127.0.0.1:5500'],
  };

  config.cors = {
    origin: '*',
    allowMethods: 'GET,HEAD,PUT,POST,DELETE,PATCH',
  };

  config.multipart = {
    mode: 'file',
    whitelist: [
      // images
      '.jpg',
      '.jpeg', // image/jpeg
      '.png', // image/png, image/x-png
      '.gif', // image/gif
      '.bmp', // image/bmp
      '.wbmp', // image/vnd.wap.wbmp
      '.webp',
      '.tif',
      '.psd',
    ],
  };

  config.proxy = true;

  return {
    ...config,
    ...userConfig,
  };
};
