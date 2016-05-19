import Foundation

class Node<T:Equatable> {
    var value: T? = nil
    var next: Node<T>? = nil
    var prev: Node<T>? = nil
    
    init() {
        
    }
    
    init(value: T) {
        self.value = value
    }
}

class LinkedList<T:Equatable> {
    var count: Int = 0
    var head: Node<T> = Node<T>()
    var tail: Node<T> = Node<T>()
    
    init () {
        
    }
    
    func isEmpty() -> Bool {
        return self.count == 0
    }
    
    func addItem (value: T) {
        //create a nod with the value of passed argument
        let node = Node<T>(value: value)
        //if list is empty, use this node as the head and the tail
        if self.self.isEmpty() {
            self.head = node
            self.tail = node
        }
        //if the list isn't empty,
        else {
            node.prev = self.tail
            self.tail.next = node
            self.tail = node
        }
        self.count++
    }
    
    func removeItemAtIndex(position: Int) {
        if self.count > position {   //make sure position exists
            if self.count != 1 { //this means there are at least 2 elements in the linked list. Int (position) can be 0 at the lowest. Count is greater than 0, and if it's not 1, it
                //must be 2 or greater.                /
                if position == 0 { //item to remove is the head so we must remove connections to the next one, and make the next one the head.
                    //let newHead = self.head.next!
                    self.head = self.head.next! //pointers to further nodes are maintained, we simply dropped out the current head and reassigned the next one
                }
                if position == self.count-1 { //item to remove is the tail so we must get the previous node and make that the new tail.
                    self.tail.prev!.next = nil //tail points to nothing, so have tail->previous have the next node be nil
                    self.tail = self.tail.prev!
                }
                if (position > 0 && position < count-1) {
                    var currentNode = self.head
                    for _ in 0...position-1 {
                        currentNode = currentNode.next!
                    }
                    //the node being stored in currentNode is now the node at the index to be deleted. Link the next and prev nodes and remove from list
                    currentNode.next!.prev = currentNode.prev //make the next node->prev to previous node
                    currentNode.prev!.next = currentNode.next //make previous node->next point to next node
                    }
                }
            if self.count == 1 { //we have a single element and we're now removing it. We won't set linked list to nil, but rather give it an initialized head that has no
                //data for next, prev or value properties
                self.head = Node<T>()
                self.tail = Node<T>()        //if we were making this circular, then we would also have a blank node for the tail, as one node can be both a head and tail
            }
            self.count-- //always maintain the element count as our operations rely on it for figuring out computations.
        }
    }
    
    func printList() {
        var output: String = "["
        var currentNode: Node? = self.head
        while (currentNode != nil) {
            output += String(currentNode!.value)
            currentNode = currentNode!.next
            if (currentNode != nil) {
                output += " "
            }
        }
        output += "]"
        print(output)
    }
}


var list = LinkedList<String>()
list.isEmpty()
list.addItem("this")
list.addItem("is a")
list.addItem("linked list")
list.addItem("in swift")

list.printList()
list.removeItemAtIndex(3)
list.printList()

