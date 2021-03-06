(*!------------------------------------------------------------
 * [[APP_NAME]] ([[APP_URL]])
 *
 * @link      [[APP_REPOSITORY_URL]]
 * @copyright Copyright (c) [[COPYRIGHT_YEAR]] [[COPYRIGHT_HOLDER]]
 * @license   [[LICENSE_URL]] ([[LICENSE]])
 *------------------------------------------------------------- *)


container.add(
    'gb-view-validator',
    TGuestBookViewValidatorFactory.create()
);

container.add(
    'gb-create-validator-middleware',
    TGuestBookCreateValidationMiddlewareFactory.create()
);

container.add(
    'gb-view-validator-middleware',
    TGuestBookViewValidationMiddlewareFactory.create()
);
