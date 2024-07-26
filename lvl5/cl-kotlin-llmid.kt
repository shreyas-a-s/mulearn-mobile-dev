// Define a class for the nodes of the linked list
class ListNode(var value: Int) {
    var next: ListNode? = null
}

// Function to find the middle node of the linked list
fun getMiddleNode(head: ListNode?): ListNode? {
    // Edge case: if the list is empty, return null
    if (head == null) return null

    // Two pointers: slow moves one step at a time, fast moves two steps at a time
    var slow: ListNode? = head
    var fast: ListNode? = head

    // Move the pointers until fast reaches the end of the list
    while (fast != null && fast.next != null) {
        slow = slow?.next
        fast = fast.next?.next
    }

    // Slow is now at the middle node
    return slow
}

// Helper function to print the linked list
fun printList(head: ListNode?) {
    var current = head
    while (current != null) {
        print("${current.value} -> ")
        current = current.next
    }
    println("null")
}

fun main() {
    // Creating a sample linked list: 1 -> 2 -> 3 -> 4 -> 5 -> null
    val head = ListNode(1)
    head.next = ListNode(2)
    head.next?.next = ListNode(3)
    head.next?.next?.next = ListNode(4)
    head.next?.next?.next?.next = ListNode(5)

    // Print the original list
    println("Original list:")
    printList(head)

    // Find the middle node
    val middle = getMiddleNode(head)

    // Print the value of the middle node
    if (middle != null) {
        println("Middle node value: ${middle.value}")
    } else {
        println("The list is empty.")
    }
}
