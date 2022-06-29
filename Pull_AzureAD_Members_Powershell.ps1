Connect-AzureAD
import-module azuread

# the groups needed to pull members from
$groups ="Global Administrator","SharePoint Administrator","Exchange Administrator"

$Role=Get-AzureADDirectoryRole

#looking through each group stated above
  foreach ($group in $groups) {

             for ($index = 0; $index -lt $Role.count; $index++){
                 if (($Role[$index]).DisplayName -eq $group){
                 $Id=($Role[$index]).ObjectId
                 $name= (Get-AzureADDirectoryRoleMember -ObjectId $Id | select DisplayName).DisplayName
                 $Description= ($Role[$index]).Description
                # $group ,($Role[$index]).Description,(Get-AzureADDirectoryRoleMember -ObjectId $Id | select DisplayName).DisplayName

           
           
           
          #@{n='Dis';e={$Description}},@{n='Name';e={$name}},$group #,@{n='Group';e={$group}}
           


         }            
}

        for ($index = 0; $index -lt $name.count; $index++){
           $user =[pscustomobject]@{
          'Displayname' = $name[$index]
           'group' = $group
            'Description' =$Description
            }
            $user | Export-CSV C:\Users\AHasan\Downloads\usermanager.csv -Append -NoTypeInformation -Force
           }
          }
         
           
 