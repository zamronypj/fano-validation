(*!------------------------------------------------------------
 * [[APP_NAME]] ([[APP_URL]])
 *
 * @link      [[APP_REPOSITORY_URL]]
 * @copyright Copyright (c) [[COPYRIGHT_YEAR]] [[COPYRIGHT_HOLDER]]
 * @license   [[LICENSE_URL]] ([[LICENSE]])
 *------------------------------------------------------------- *)
unit GuestBookValidatorFactory;

interface

uses
    fano;

type

    (*!-----------------------------------------------
     * Factory for controller TGuestBookController
     *
     * @author [[AUTHOR_NAME]] <[[AUTHOR_EMAIL]]>
     *------------------------------------------------*)
    TGuestBookValidatorFactory = class(TFactory, IDependencyFactory)
    public
        function build(const container : IDependencyContainer) : IDependency; override;
    end;

implementation

uses
    sysutils;

    function TGuestBookValidatorFactory.build(const container : IDependencyContainer) : IDependency;
    begin
        result := (TValidationCollection.create(THashList.create()))

            //add validator for route guestbook-create
            .add(
                'guestbook-create',
                (new TValidation.create(THashList.create()))
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
                    )
            )

            //add validator for route guestbook-view
            .add(
                'guestbook-view',
                (new TValidation.create(THashList.create()))
                    .add(
                        'id',
                        new CompositeValidator([
                            new RequiredValidator(),
                            new AlphaNumSpaceValidator()
                        ])
                    )
            )
    end;
end.
