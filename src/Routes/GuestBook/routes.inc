(*!------------------------------------------------------------
 * [[APP_NAME]] ([[APP_URL]])
 *
 * @link      [[APP_REPOSITORY_URL]]
 * @copyright Copyright (c) [[COPYRIGHT_YEAR]] [[COPYRIGHT_HOLDER]]
 * @license   [[LICENSE_URL]] ([[LICENSE]])
 *------------------------------------------------------------- *)

router.get(
    '/guestbook',
    container.get('guestbookController') as IRequestHandler
).setName('guestbook-view')
.add(container.get('gb-view-validator-middleware') as IMiddleware);
