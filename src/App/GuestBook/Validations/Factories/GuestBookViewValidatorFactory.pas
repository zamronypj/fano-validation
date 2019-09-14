
(*!------------------------------------------------------------
 * Fano Web Framework Skeleton Application (https://fanoframework.github.io)
 *
 * @link      https://github.com/fanoframework/fano-app-middleware
 * @copyright Copyright (c) 2018 Zamrony P. Juhara
 * @license   https://github.com/fanoframework/fano-app-middleware/blob/master/LICENSE (GPL 3.0)
 *------------------------------------------------------------- *)
unit GuestBookViewValidatorFactory;

interface

uses
    fano;

type

    TGuestBookViewValidatorFactory = class(TFactory, IDependencyFactory)
    public
        function build(const container : IDependencyContainer) : IDependency; override;
    end;

implementation

uses
    sysutils;

    function TGuestBookViewValidatorFactory.build(const container : IDependencyContainer) : IDependency;
    begin
        result := (TValidation.create(THashList.create()))
            .addRule(
                'id',
                TCompositeValidator.create([
                    TRequiredValidator.create(),
                    TAlphaNumSpaceValidator.create(TRegex.create())
                ])
            ) as IDependency;
    end;
end.
