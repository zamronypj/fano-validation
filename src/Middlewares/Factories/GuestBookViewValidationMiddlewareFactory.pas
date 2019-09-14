
(*!------------------------------------------------------------
 * Fano Web Framework Skeleton Application (https://fanoframework.github.io)
 *
 * @link      https://github.com/fanoframework/fano-app-middleware
 * @copyright Copyright (c) 2018 Zamrony P. Juhara
 * @license   https://github.com/fanoframework/fano-app-middleware/blob/master/LICENSE (GPL 3.0)
 *------------------------------------------------------------- *)
unit GuestBookViewValidationMiddlewareFactory;

interface

uses
    fano;

type

    TGuestBookViewValidationMiddlewareFactory = class(TFactory, IDependencyFactory)
    public
        function build(const container : IDependencyContainer) : IDependency; override;
    end;

implementation

uses
    sysutils;

    function TGuestBookViewValidationMiddlewareFactory.build(const container : IDependencyContainer) : IDependency;
    begin
        result := TValidationMiddleware.create(
            container.get('gb-view-validator') as IRequestValidator
        );
    end;
end.
