pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

contract Multiply {

	// State variable storing the sum of arguments that were passed to function 'add',
	uint public product = 1;
    uint constant max = 11;
	uint constant min = 0;
	

	constructor() public {
		// check that contract's public key is set
		require(tvm.pubkey() != 0, 101);
		// Check that message has signature (msg.pubkey() is not zero) and message is signed with the owner's private key
		require(msg.pubkey() == tvm.pubkey(), 102);
		tvm.accept();
	}

	// Modifier that allows to accept some external messages
	modifier checkOwnerAndAccept {
		// Check that message was signed with contracts key.
		require(msg.pubkey() == tvm.pubkey(), 102);
        
		tvm.accept();
        
		_;
	}

	// Function that adds its argument to the state variable.
	function Mul(uint value) public checkOwnerAndAccept {
        require(value < max );
		require(value > min );
		product = product*value;
        
	}
}
