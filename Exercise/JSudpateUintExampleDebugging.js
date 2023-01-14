(async () => {
    const address = "0xd9145CCE52D386f254917e481eB44e9943F39138";
    const abiArray = [
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "newUint",
				"type": "uint256"
			}
		],
		"name": "setMyUint",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "myUint",
		"outputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"stateMutability": "view",
		"type": "function"
	}
];

    const contractInstances = new web3.eth.Contract(abiArray, address);

    console.log(await contractInstances.methods.myUint().call());

    let account = await web3.eth.getAccounts();
    let result = await contractInstances.methods.setMyUint(235).send({from: account[0]});

    console.log(await contractInstances.methods.myUint().call());
    console.log(result);

})()
