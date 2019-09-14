(*!------------------------------------------------------------
 * [[APP_NAME]] ([[APP_URL]])
 *
 * @link      [[APP_REPOSITORY_URL]]
 * @copyright Copyright (c) [[COPYRIGHT_YEAR]] [[COPYRIGHT_HOLDER]]
 * @license   [[LICENSE_URL]] ([[LICENSE]])
 *------------------------------------------------------------- *)

 {-----------------------------------------------
   register middleware list for each routes that
   does nothing,
   need to be use factory so each route will have
   different middleware list
   Replace with TMiddlewareCollectionAwareFactory to support middleware
   or replace with your own implementation if required
 ------------------------------------------------}
container.add('appMiddlewares', TMiddlewareCollectionAwareFactory.create());
container.factory('routeMiddlewares', TMiddlewareCollectionAwareFactory.create());

container.add(
    'gb-create-validator-middleware',
    TGuestBookCreateValidationMiddlewareFactory.create()
);

container.add(
    'gb-view-validator-middleware',
    TGuestBookViewValidationMiddlewareFactory.create()
);

container.add(
    GuidToString(IDispatcher),
    TDispatcherFactory.create(
        container.get('appMiddlewares') as IMiddlewareCollectionAware,
        container.get(GuidToString(IRouteMatcher)) as IRouteMatcher,
        TRequestResponseFactory.create()
    )
);
