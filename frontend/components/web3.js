import Web3 from 'web3';

let web3;

if (typeof window !== 'undefined' && typeof window.ethereum !== 'undefined') {
  // Use MetaMask provider
  web3 = new Web3(window.ethereum);
  window.ethereum.enable();
} else {
  // Use fallback provider
  const provider = new Web3.providers.HttpProvider(
    'https://exchaintestrpc.okex.org'
  );
  web3 = new Web3(provider);
}

export default web3;
