// Extension function to get the digit at the specified index from the right
fun Int.getDigitAt(index: Int): Int {
    val str = this.toString()
    return if (index < str.length) {
        str[str.length - 1 - index].toString().toInt()
    } else {
        0
    }
}

// Extension property to get the number of digits in the integer
val Int.digitCount: Int
    get() = this.toString().length

// Function to get the maximum number of digits in a list of integers
fun getMaxDigitCount(numbers: List<Int>): Int {
    var maxDigits = 0
    for (number in numbers) {
        val digitCount = number.digitCount
        if (digitCount > maxDigits) {
            maxDigits = digitCount
        }
    }
    return maxDigits
}

// Radix Sort function
fun radixSort(numbers: List<Int>): List<Int> {
    if (numbers.isEmpty()) return numbers

    val maxDigitCount = getMaxDigitCount(numbers)
    var sortedList = numbers

    for (digitIndex in 0 until maxDigitCount) {
        val buckets = Array<MutableList<Int>>(10) { mutableListOf() }

        for (number in sortedList) {
            val digit = number.getDigitAt(digitIndex)
            buckets[digit].add(number)
        }

        sortedList = buckets.flatten()
    }

    return sortedList
}

fun main() {
    val numbers = listOf(170, 45, 75, 90, 802, 24, 2, 66)
    println("Original list: $numbers")
    val sortedNumbers = radixSort(numbers)
    println("Sorted list: $sortedNumbers")
}
