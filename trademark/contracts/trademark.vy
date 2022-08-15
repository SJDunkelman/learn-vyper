# @version ^0.3.0

struct Trademark:
    phrase: String[100]
    author_name: String[100]
    registration_time: uint256
    proof: bytes32


trademark_lookup: HashMap[bytes32, bool]
trademark_registry: HashMap[bytes32, Trademark]

@external
@view
def check_trademark(phrase: String[100]) -> bool:
    proof: bytes32 = keccak256(phrase)
    return self.trademark_lookup[proof]

@external
def register_trademark(phrase_text: String[100], author: String[100]) -> bool:
    trademark_check: bool = self.trademark_lookup[keccak256(phrase_text)]
    if trademark_check == False:
        proof_hash: bytes32 = keccak256(phrase_text)
        self.trademark_registry[proof_hash] = Trademark({
            phrase: phrase_text,
            author_name: author,
            registration_time: block.timestamp,
            proof: proof_hash
        })
        self.trademark_lookup[proof_hash] = True
        return True
    return False

@external
@view
def get_trademark_data(phrase: String[100]) -> (String[100],String[100], uint256, bytes32):
    trademark: Trademark = self.trademark_registry[keccak256(phrase)]
    return trademark.phrase, trademark.author_name, trademark.registration_time, trademark.proof
