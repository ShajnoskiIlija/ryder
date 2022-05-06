# README
Ryder is a rental and sharing application that helps people to connect owners with people looking to rent or borrow. Through this application, owners can lists their bikes, electric scooters, summer or winter equipment. People can search for a rentals listed in 4 categories, if people want to request some rent item it can be easily done just by clicking 'Send Request'. Next, the owner can see requested rent item on his 'Dashboard' by opening side menu and clicking on 'View Request', with provided informations about the requester and easily accept od reject the request. After this, email will be automatically send to requester or requesters with provided informations, depending on whether the item is accepted or rejected. For overview on all rent items that are published, you need to sign in and then navigate to 'Dashboard' -> 'My Rent'. You can view the information about rent item and edit it by clicking on 'Edit'. For creating new rent item, just go to 'Dashboard' -> 'New Rent'. For editing account info, 'Dashboard' -> 'Account'.


* Ruby version
-'3.0.2'

* Rails version
-'6.1.4'

* Database
- Use Postgresql as the database
-'1.1'

* Technologies used:
-Ruby
-Rails
-TailwindCSS

* Deployment instructions
-Clone the repository
-Make sure you have the suitable versions as stated above
-Run the following commands:

    bundle
    yarn install
    rails db:create && rails db:migrate && rails db:seed
    rails server

- Open your browser and go to http://localhost:3000/
