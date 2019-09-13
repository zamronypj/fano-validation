
(*!------------------------------------------------------------
 * Fano Web Framework Skeleton Application (https://fanoframework.github.io)
 *
 * @link      https://github.com/fanoframework/fano-app-middleware
 * @copyright Copyright (c) 2018 Zamrony P. Juhara
 * @license   https://github.com/fanoframework/fano-app-middleware/blob/master/LICENSE (GPL 3.0)
 *------------------------------------------------------------- *)
unit GuestBookCreateValidationMiddlewareFactory;

interface

uses
    fano;

type

    TGuestBookCreateValidationMiddlewareFactory = class(TFactory, IDependencyFactory)
    private
        function createValidator() : IValidation;
    public
        function build(const container : IDependencyContainer) : IDependency; override;
    end;

implementation

uses
    sysutils;

    function TGuestBookCreateValidationMiddlewareFactory.createValidator() : IValidation;
    begin
        result := (new TValidation.create(THashList.create()))
            .add(
                'name',
                new CompositeValidator([
                    new RequiredValidator(),
                    new AlphaNumSpaceValidator()
                ])
            ).add(
                'email',
                new CompositeValidator([
                    new RequiredValidator(),
                    new EmailValidator()
                ])
            ).add(
                'address',
                new AphaNumSpaceValidator()
            );
    end;

    function TGuestBookCreateValidationMiddlewareFactory.build(const container : IDependencyContainer) : IDependency;
    begin
        result := TValidationMiddleware.create(createValidator());
    end;
end.
