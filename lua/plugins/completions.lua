 return {
   -- Add path auto-completion
   {
     "hrsh7th/cmp-path",
     config = function()
       require('cmp').setup {
         sources = {
           { name = 'path' }
         }
       }
     end
   },
   {
     "hrsh7th/cmp-nvim-lsp",
     config = function()
       require('cmp').setup {
         sources = {
           { name = 'nvim_lsp' }
         }
       }
     end
   }
 }
