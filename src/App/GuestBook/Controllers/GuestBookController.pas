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
        fValidator : IRequestValidator;
    public
        constructor create(
            const amiddlewares : IMiddlewareCollectionAware;
            const validator : IRequestValidator
        );

        destructor destroy(); override;

        function handleRequest(
            const request : IRequest;
            const response : IResponse
        ) : IResponse; override;
    end;

implementation

    constructor TGuestBookController.create(
        const amiddlewares : IMiddlewareCollectionAware;
        const validator : IRequestValidator
    );
    begin
        inherited create(amiddlewares);
        fValidator := validator;
    end;

    destructor TGuestBookController.destroy();
    begin
        fValidator := nil;
        inherited destroy();
    end;

    function TGuestBookController.handleRequest(
          const request : IRequest;
          const response : IResponse
    ) : IResponse;
    var validationRes : TValidationResult;
        i, len : integer;
    begin
        {---put your code here---}
        validationRes := fValidator.lastValidationResult();
        if validationRes.isValid then
        begin
            response.body().write('nice');
        end else
        begin
            response.body().write('<div>Validation fail:</div><ul>');
            len := length(validationRes.errorMessages);
            for i:=0 to len-1 do
            begin
                response.body().write('<li>' + validationRes.errorMessages[0].errorMessage + '</li>');
            end;
            response.body().write('</ul>');
        end;
        result := response;
    end;

end.
