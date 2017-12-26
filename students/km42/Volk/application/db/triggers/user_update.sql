CREATE OR REPLACE TRIGGER user_update
  BEFORE UPDATE ON "User"
  FOR EACH ROW
declare
  ex_custom EXCEPTION;
  PRAGMA EXCEPTION_INIT( ex_custom, -20001 );
BEGIN
  IF :NEW."email" <> :OLD."email" THEN
    RAISE_APPLICATION_ERROR(-20001, 'ACCESS DENIED');
  END IF;
END;
