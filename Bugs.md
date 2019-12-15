#  Bugs

## Type Mismatch:
Message Board[27610:1964808] Error decoding message threads from JSON data: typeMismatch(Swift.Array<Any>, Swift.DecodingError.Context(codingPath: [], debugDescription: "Expected to decode Array<Any> but found a dictionary instead.", underlyingError: nil))

Changed fetchMessageThreads request to decode an array instead of a dictionary.  

Added CodingKeys in MessageThread model and  added compactMap to filter out nil values.
