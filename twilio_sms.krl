ruleset twilio_sms {

  meta {
        
        key twilio {"account_sid" : “<account SID here>",
                    "auth_token"  : “<auth token here>"
        }
        
        use module a8x115 alias twilio with twiliokeys = keys:twilio()
       
  } 

    rule sms {
      select when notification status 
      twilio:send_sms(event:attr("phone_number"), event:attr("from_number"), event:attr("message"));
    }
  
}