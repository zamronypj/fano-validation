(*!------------------------------------------------------------
 * [[APP_NAME]] ([[APP_URL]])
 *
 * @link      [[APP_REPOSITORY_URL]]
 * @copyright Copyright (c) [[COPYRIGHT_YEAR]] [[COPYRIGHT_HOLDER]]
 * @license   [[LICENSE_URL]] ([[LICENSE]])
 *------------------------------------------------------------- *)
unit GuestBookModelFactory;

interface

uses
    fano;

type

    (*!-----------------------------------------------
     * Factory for model TGuestBookModel
     *
     * @author [[AUTHOR_NAME]] <[[AUTHOR_EMAIL]]>
     *------------------------------------------------*)
    TGuestBookModelFactory = class(TFactory)
    public
        function build(const container : IDependencyContainer) : IDependency; override;
    end;

implementation

uses

    SysUtils,

    {*! -------------------------------
        unit interfaces
    ----------------------------------- *}
    GuestBookModel;

    function TGuestBookModelFactory.build(const container : IDependencyContainer) : IDependency;
    var db : IRdbms;
    begin
        {---initialize database here---}
        db := nil;
        { db := container.get('db') as IRdbms;}
        result := TGuestBookModel.create(db);
    end;
end.
