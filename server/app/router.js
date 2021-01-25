'use strict';

/**
 * @param {Egg.Application} app - egg application
 */
module.exports = (app) => {
  const { router, controller } = app;
  router.get('/', controller.home.index);
  router.get('/getdata', controller.home.getData);
  router.post('/save', controller.home.save);
  router.get('/getdetail', controller.home.getDetail);
  router.post('/upload', controller.home.upload);
  router.post('/firstsave', controller.home.firstSave);
  router.post('/deleteimg', controller.home.deleteImg);
  router.get('/deleterecord', controller.home.deleteRecord);
};
