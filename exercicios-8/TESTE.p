DO ON ERROR UNDO, LEAVE:
    FIND FIRST Customer NO-LOCK WHERE Customer.CustNum = 3712123.
  
    CATCH oneError AS Progress.Lang.SysError:
      MESSAGE "Bloco 1"
          VIEW-AS ALERT-BOX INFORMATION BUTTONS OK.
      MESSAGE oneError:GetMessage(1) VIEW-AS ALERT-BOX BUTTONS OK.
    END CATCH.
  
    CATCH twoError AS Progress.Lang.ProError:
      MESSAGE "Bloco 2"
          VIEW-AS ALERT-BOX INFORMATION BUTTONS OK.
      MESSAGE twoError:GetMessage(1) VIEW-AS ALERT-BOX BUTTONS OK.
    END CATCH.
  END. /* FIRST DO */