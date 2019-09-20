(*!------------------------------------------------------------
 * [[APP_NAME]] ([[APP_URL]])
 *
 * @link      [[APP_REPOSITORY_URL]]
 * @copyright Copyright (c) [[COPYRIGHT_YEAR]] [[COPYRIGHT_HOLDER]]
 * @license   [[LICENSE_URL]] ([[LICENSE]])
 *------------------------------------------------------------- *)
unit GuestBookControllerFactory;

interface

uses
    fano;

type

    (*!-----------------------------------------------
     * Factory for controller TGuestBookController
     *
     * @author [[AUTHOR_NAME]] <[[AUTHOR_EMAIL]]>
     *------------------------------------------------*)
    TGuestBookControllerFactory = class(TFactory, IDependencyFactory)
    public
        function build(const container : IDependencyContainer) : IDependency; override;
    end;

implementation

uses
    sysutils,

    {*! -------------------------------
        unit interfaces
    ----------------------------------- *}
    GuestBookController;

    function TGuestBookControllerFactory.build(const container : IDependencyContainer) : IDependency;
    begin
        result := TGuestBookController.create(
            container.get('gb-view-validator') as IRequestValidator
        );
    end;
end.
