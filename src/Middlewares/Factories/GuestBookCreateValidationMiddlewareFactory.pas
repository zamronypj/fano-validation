
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
        function createValidator() : IRequestValidator;
    public
        function build(const container : IDependencyContainer) : IDependency; override;
    end;

implementation

uses
    sysutils;

    function TGuestBookCreateValidationMiddlewareFactory.createValidator() : IRequestValidator;
    begin
        result := ((TValidation.create(THashList.create()))
            .addRule(
                'name',
                TCompositeValidator.create([
                    TRequiredValidator.create(),
                    TAlphaNumSpaceValidator.create(TRegex.create())
                ])
            ).addRule(
                'email',
                TCompositeValidator.create([
                    TRequiredValidator.create(),
                    TEmailValidator.create(TRegex.create())
                ])
            ).addRule(
                'address',
                TAlphaNumSpaceValidator.create(TRegex.create())
            ) as IRequestValidator);
    end;

    function TGuestBookCreateValidationMiddlewareFactory.build(const container : IDependencyContainer) : IDependency;
    begin
        result := TValidationMiddleware.create(createValidator());
    end;
end.
