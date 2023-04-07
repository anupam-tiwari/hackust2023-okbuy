import web3 from './web3';
import abi_json from './contract_abi.json';

const address = '0x5e0E8ceecbD489B89930E1Da6Fed710D00D74ab4'; // Replace with your contract address
const abi = abi_json;

const contract = new web3.eth.Contract(abi, address);

export default contract;
