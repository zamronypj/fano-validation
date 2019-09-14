(*!------------------------------------------------------------
 * [[APP_NAME]] ([[APP_URL]])
 *
 * @link      [[APP_REPOSITORY_URL]]
 * @copyright Copyright (c) [[COPYRIGHT_YEAR]] [[COPYRIGHT_HOLDER]]
 * @license   [[LICENSE_URL]] ([[LICENSE]])
 *------------------------------------------------------------- *)

(router.get(
    '/guestbook',
    container.get('guestbookController') as IRouteHandler
) as IMiddlewareCollectionAware)
.addBefore(container.get('gb-view-validator-middleware') as IMiddleware);

// (router.post(
//     '/guestbook',
//     container.get('guestbookPostController') as IRouteHandler
// ) as IMiddlewareCollectionAware)
// .addBefore(container.get('gb-create-validator-middleware') as IMiddleware);
