#  Bugs

## 1.  Type Mismatch Console Error:
Message Board[27610:1964808] Error decoding message threads from JSON data: typeMismatch(Swift.Array<Any>, Swift.DecodingError.Context(codingPath: [], debugDescription: "Expected to decode Array<Any> but found a dictionary instead.", underlyingError: nil))

Changed fetchMessageThreads request to decode an array instead of a dictionary.  

Added CodingKeys in MessageThread model and  added compactMap to filter out nil values.

## 2.  Entering text into textfield doesn't create a thread:
Added .resume() to createMessage function in MessageThreadController.  Created thread is added to db and populates in tableviewcontroller

## 3.  When navigating back to tableviewcontroller from detailviewcontroller or when loading app, created thread does not persist.

Commented out self.tableView.reloadData() in the viewWillAppear() method in MessageThreadViewController.  I believe that messages are appearing when we navigate back from the detail tableview controller, because the tableview is no longer wiping them when reloading data, but also, we're not displaying from the api - so this is still somewhat of a bug.  Unsure if it's something I've not addressed correctly, or an intended bug to find.  Will come back to this.

Also updated to Swift 5 in this step to eliminate the warning in Xcode and moved properties to the top of the file in some files, and reformatted some non-affected/relevant code.

## 4 (& 5?)  Send button in MessageDetailViewController doesn't create message, and when you go back to the root view controller from trying to add a message and clicking on the thread again, the app crashes and you get the following error:

`Fatal error: Index out of range`

Corrected segue typo from AddMesage to AddMessage.  Added popViewController method in sendMessage action.

Also rewrote the code to decode the dictionary and messages appear in the MessageThreadsTableViewController.  Fetched Messages appear from db and app no longer crashes.
