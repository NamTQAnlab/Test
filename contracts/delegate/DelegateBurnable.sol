pragma solidity ^0.4.24;


// Interface implemented by tokens that are the *target* of a BurnableToken's
// delegation. That is, if we want to replace BurnableToken X by
// Y but for convenience we'd like users of X
// to be able to keep using it and it will just forward calls to Y,
// then X should extend CanDelegate and Y should extend DelegateBurnable.
// Most ERC20 calls use the value of msg.sender to figure out e.g. whose
// balance to update; since X becomes the msg.sender of all such calls
// that it forwards to Y, we add the origSender parameter to those calls.
// Delegation is intended as a convenience for legacy users of X since
// we do not expect all regular users to learn about Y and change accordingly,
// but we do require the *owner* of X to now use Y instead so ownerOnly
// functions are not delegated and should be disabled instead.
// This delegation system is intended to work with the modified versions of
// the standard ERC20 token contracts, allowing the balances
// to be moved over to a new contract.
// NOTE: To maintain backwards compatibility, these function signatures
// cannot be changed
contract DelegateBurnable {
  function delegateTotalSupply() public view returns (uint256);
  
  function delegateBalanceOf(address _who) public view returns (uint256);

  function delegateTransfer(address _to, uint256 _value, address _origSender)
    public returns (bool);

  function delegateAllowance(address _owner, address _spender)
    public view returns (uint256);

  function delegateTransferFrom(
    address _from,
    address _to,
    uint256 _value,
    address _origSender
  )
    public returns (bool);

  function delegateApprove(
    address _spender,
    uint256 _value,
    address _origSender
  )
    public returns (bool);

  function delegateIncreaseApproval(
    address _spender,
    uint256 _addedValue,
    address _origSender
  )
    public returns (bool);

  function delegateDecreaseApproval(
    address _spender,
    uint256 _subtractedValue,
    address _origSender
  )
    public returns (bool);

  function delegateBurn(
    address _origSender,
    uint256 _value,
    string _note
  )
    public;
}
