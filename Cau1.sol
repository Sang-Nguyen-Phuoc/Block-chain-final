// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract TicTacToe {
    /* 
        Bài này giải sử bạn đã biết xử lý mảng lổng nhau                                                                                                                                                                                                                                                                
        1. Hợp đồng này kiểm tra, TicTacToe thắng hay thua.
        2. Viết code trong `isWinning` function trả về true nếu game này có người chiến thắng hoặc trả về false nếu không ai thắng.
        3. Bảng bao gồm 1 và 0, nó cùng là mảng 3x3.
        
        [[1, 1, 0], 
         [0, 1, 0],
         [1, 0, 1]] => true (thắng theo hàng học)
    */

     function isWinning(uint8[3][3] memory board) public pure returns (bool) {
        uint8 center = board[1][1];

        // Check cols and rows
        if ((board[0][0] == center && center == board[2][2]) || (board[0][2] == center && center == board[2][0]) ||
            (board[0][1] == center && center == board[2][1]) || (board[1][0] == center && center == board[1][2])) {
            return true;
        }

        // Check diagonals
        if ((board[0][1] == center && center == board[2][1]) || (board[1][0] == center && center == board[1][2])) {
            return true;
        }

        return false;
    }
}