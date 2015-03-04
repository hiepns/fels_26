    module Prawn  
      module Errors  
         FailedObjectConversion = Class.new(StandardError)  
                
         InvalidPageLayout = Class.new(StandardError)       
         
         NotOnPage = Class.new(StandardError)  
      
         UnknownFont = Class.new(StandardError)  
      
         IncompatibleStringEncoding = Class.new(StandardError)       
      
         UnknownOption = Class.new(StandardError)   
      
      end  
    end  