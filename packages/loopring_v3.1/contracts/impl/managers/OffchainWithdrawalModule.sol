/*

  Copyright 2017 Loopring Project Ltd (Loopring Foundation).

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
*/
pragma solidity ^0.5.11;

import "../modules/OffchainWithdrawalModule.sol";

import "../../iface/IExchangeModuleFactory.sol";
import "./../CircuitManager.sol";

/// @title OffchainWithdrawalManager
/// @author Brecht Devos - <brecht@loopring.org>
contract OffchainWithdrawalManager is IExchangeModuleFactory, CircuitManager
{
    function createModule(
        address exchangeAddress
        )
        external
        returns (address)
    {
        // Can deploy the module using a proxy (if supported), cloning,...
        OffchainWithdrawalModule instance = new OffchainWithdrawalModule(exchangeAddress, address(this));
        return address(instance);
    }
}