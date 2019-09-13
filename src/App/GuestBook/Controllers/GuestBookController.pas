(*!------------------------------------------------------------
 * [[APP_NAME]] ([[APP_URL]])
 *
 * @link      [[APP_REPOSITORY_URL]]
 * @copyright Copyright (c) [[COPYRIGHT_YEAR]] [[COPYRIGHT_HOLDER]]
 * @license   [[LICENSE_URL]] ([[LICENSE]])
 *------------------------------------------------------------- *)
unit GuestBookController;

interface

uses

    fano;

type

    (*!-----------------------------------------------
     * controller that handle route :
     * /guestbook
     *
     * See Routes/GuestBook/routes.inc
     *
     * @author [[AUTHOR_NAME]] <[[AUTHOR_EMAIL]]>
     *------------------------------------------------*)
    TGuestBookController = class(TRouteHandler)
    private
        fValidator : IValidation;
    public
        function handleRequest(
            const request : IRequest;
            const response : IResponse
        ) : IResponse; override;
    end;

implementation

    function TGuestBookController.handleRequest(
          const request : IRequest;
          const response : IResponse
    ) : IResponse;
    begin
        {---put your code here---}
        //response.body().write('nice');
        result := response;
    end;

end.
