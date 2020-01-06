(*!------------------------------------------------------------
 * [[APP_NAME]] ([[APP_URL]])
 *
 * @link      [[APP_REPOSITORY_URL]]
 * @copyright Copyright (c) [[COPYRIGHT_YEAR]] [[COPYRIGHT_HOLDER]]
 * @license   [[LICENSE_URL]] ([[LICENSE]])
 *------------------------------------------------------------- *)
unit bootstrap;

interface

uses

    fano;

type

    TAppServiceProvider = class(TDaemonAppServiceProvider)
    protected
        function buildDispatcher(
            const ctnr : IDependencyContainer;
            const routeMatcher : IRouteMatcher;
            const config : IAppConfiguration
        ) : IDispatcher; override;
    public
        procedure register(const container : IDependencyContainer); override;
    end;

    TAppRoutes = class(TRouteBuilder)
    public
        procedure buildRoutes(
            const container : IDependencyContainer;
            const router : IRouter
        ); override;
    end;

implementation

uses
    sysutils

    (*! -------------------------------
     *   controllers factory
     *----------------------------------- *)
    {---- put your controller factory here ---},
    GuestBookControllerFactory,
    GuestBookViewFactory,
    GuestBookModelFactory,
    GuestBookCreateValidationMiddlewareFactory,
    GuestBookViewValidatorFactory,
    GuestBookViewValidationMiddlewareFactory,
    HomeControllerFactory;

    function TAppServiceProvider.buildDispatcher(
        const ctnr : IDependencyContainer;
        const routeMatcher : IRouteMatcher;
        const config : IAppConfiguration
    ) : IDispatcher;
    begin
        ctnr.add('appMiddlewares', TMiddlewareListFactory.create());
        ctnr.add(
            GuidToString(IDispatcher),
            TDispatcherFactory.create(
                ctnr.get('appMiddlewares') as IMiddlewareLinkList,
                routeMatcher,
                TRequestResponseFactory.create()
            )
        );
        result := ctnr.get(GuidToString(IDispatcher)) as IDispatcher;
    end;

    procedure TAppServiceProvider.register(const container : IDependencyContainer);
    begin
        {$INCLUDE Dependencies/dependencies.inc}
    end;

    procedure TAppRoutes.buildRoutes(
        const container : IDependencyContainer;
        const router : IRouter
    );
    begin
        {$INCLUDE Routes/routes.inc}
    end;
end.
