// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract BasicBankV2 {
    /// sử dụng để lưu trữ số dư của người dùng
    ///     USER    =>  BALANCE
    mapping(address => uint256) public balances;

    event EtherAdded(address indexed user, uint256 amount);
    event EtherRemoved(address indexed user, uint256 amount);

    /// @notice gửi ether vào contract
    /// @dev mong muốn nó hoạt động tốt khi thực hiện nhiều lần
    function addEther() external payable {
        require(msg.value > 0, "Transaction Error!");

        balances[msg.sender] += msg.value; 
        emit EtherAdded(msg.sender, msg.value);
    }

    /// @notice sử dụng để rút tiền khỏi hợp đồng
    /// @param amount là số lượng muốn rút. Không thể rút nếu vượt quá số dư
    function removeEther(uint256 amount) external payable {
        require(amount > 0, "Invalid amount");
        amount *= 10**18; 
        require(amount <= balances[msg.sender], "Not enough Ether to withdraw");

        balances[msg.sender] -= amount;
        (bool sent,) = msg.sender.call{value: amount}("");
        require(sent, "Failed to withdraw");

        emit EtherRemoved(msg.sender, amount);
    }
}