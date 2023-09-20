# tezos-baker
Boilerplate code to set up a minimalistic Tezos baker capable of baking, accusing, and paying its delegators.

This code:
- installs octez-node, octez-baker, octez-accuser, and Tezpay on a single machine
- provides some basic maintenance tools.


## Disclaimer

This repository is not intended to provide perfect code, but code as simple as possible and sufficient to start a baking activity.

As a result, it is not state-of-the-art in terms of automation, high availability, or security. We will address these aspects throughout this documentation when relevant. In any case, we decline all responsibility in the event of damages, theft of crypto-assets, operational or security incidents, as detailed further in the LICENSE.txt file.

Additionally, this code doesn't leverage all the options provided by octez and Tezpay. We encourage you to read the documentation for these tools and enhance your setup, transforming this basic configuration into something remarkable.
- octez: https://tezos.gitlab.io/index.html
- Tezpay: https://docs.tez.capital/tezpay/tutorials/ 


## Prerequisites

This code is designed to run on a Linux platform.

Hardware requirements:
- 2 CPU cores
- Preferably 8GB RAM
- 300GB SSD drive

Before using this code, you should also have:
- a Tezos account set up to become the baker, and funded with a sufficient amount of XTZ.
- a Tezos account set up to handle the payouts.


## Initial setup

- Ensure `/usr/local/bin` is part of the `PATH` environment variable on your machine.
- Copy the files located in the `usr/local/bin` directory of this repository to the `/usr/local/bin` directory on your machine.
- Make sure all these files are executable by the users intended to run them.
- Edit the file `/usr/local/bin/tezos-env.sh` as some variables need configuration:
    - `PROTOCOL`: This should be the active Tezos protocol.
    - `PROTOCOL_VERSION`: This should be the version number tagged as "latest" in the Serokell Tezos packaging repository: https://github.com/serokell/tezos-packaging/releases
    - `DATA_DIR`: The directory where the data needed by octez and Tezpay will be stored (requires large storage space).
    - `KEY_BAKER`: This should be the friendly name you'd like to use as an alias for your baker address when managing your baker. This name is not shared publicly; it is used only locally.
    - `BAKER_ACCOUNT_HASH`: The tzXXX address of your baker.
    - `BAKER_LIQUIDITY_BAKING_SWITCH`: The liquidity baking vote (off, on, or pass). See https://tezos.gitlab.io/active/liquidity_baking.html for more details.
    - `TEZPAY_ACCOUNT_HASH`: The tzYYY address of your payout account.
    - `TEZPAY_ACCOUNT_PRIVATE_KEY`: The unencrypted private key of your payout account. SECURITY WARNING: This account should only hold enough XTZ to pay your delegators. Since this key is stored unencrypted on your machine, an attacker with access to it could withdraw your funds. We strongly recommend using a more secure system, such as a Ledger or a remote signer, as soon as possible. For more information, see https://docs.tez.capital/tezpay/tutorials/how-to-setup/
    - `TEZPAY_FEES`: The baking fee you wish to charge your delegators, ranging from 0 (0%) to 1 (100%).
- Next, follow the step-by-step instructions in the `initial-setup.sh` file from this repository. Don't execute this file as a script. Instead, copy and run the instructions one at a time, as you'll be prompted to take several actions throughout the process. These actions are described in the comments appearing in this file.


## Maintenance

The `maintenance-cheat-sheet.sh` file includes the following sections:
- Restart / reboot: Restart/Reboot: Instructions for when you need to restart, possibly due to reasons such as Linux distribution maintenance.
- Upgrade octez: Steps for updating when a new version of octez is released. This section also covers Tezos protocol upgrades.
- Upgrade TezPay: Procedures for when a new version of TezPay is available.
- Stake management: Guidelines on setting your baker's deposit limit and replenishing your payout account.
- Voting process: Help on how to vote at the various stages of the Tezos amendment and voting process (https://tezos.gitlab.io/active/voting.html).

Don't execute this file as a script. Instead, copy and run the instructions of the section that interests you one at a time, as you'll be prompted to take several actions throughout the process. These actions are described in the comments appearing in this file.
