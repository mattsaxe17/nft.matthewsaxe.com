<template>
  <div>
    <div id="content-section">
      <marketplace-header :account="account" />
      <marketplace-body :account="account">
        <template v-slot:notifications>
          <v-alert v-if="!!notification" color="#EB5E28" elevation="11" outlined :type="notificationType">{{ notification }}</v-alert>
        </template>
      </marketplace-body>
    </div>

    <portal to="connect-wallet">
      <button @click="walletInteraction">{{ !!account.address ? account.address : 'Connect Wallet' }}</button>
    </portal>
  </div>
</template>

<script>
import MarketplaceHeader from '~/components/MarketplaceHeader.vue';
import MarketplaceBody from '~/components/MarketplaceBody.vue';

const Web3 = require('web3');

export default {
  components: {
    MarketplaceHeader,
    MarketplaceBody,
  },
  data() {
    return {
      account: {
        address: null,
        balance: 0,
      },
      web3: new Web3(Web3.givenProvider || 'ws://localhost:8545'),
      notification: null,
      notificationType: null,
    };
  },
  methods: {
    async walletInteraction() {
      const accounts = await ethereum.request({ method: 'eth_requestAccounts' });
      this.populateAccount();
    },
    populateAccount(cb = () => {}) {
      if (!!ethereum.selectedAddress) {
        this.account.address = ethereum.selectedAddress;

        this.web3.eth.getBalance(ethereum.selectedAddress).then(balance => {
          this.account.balance = balance / 1000000000000000000.0;
        });

        cb()
      } else {
        this.account.address = '';
        this.account.balance = 0;
      }
    },
  },
  mounted() {
    if (!ethereum.isMetaMask) {
      this.notification = 'Metamask is not installed!';
      this.notificationType = 'warning';
    }

    ethereum.on('connect', () => {
      let iterations = 0;

      const interval = setInterval(() => {
        if (iterations > 20) clearInterval(interval);
        this.populateAccount(() => clearInterval(interval));

        iterations++;
      }, 100);
    });

    ethereum.on('accountsChanged', () => {
      this.populateAccount();
    });
  },
};
</script>

<style lang="scss">
#content-section {
  padding-top: 8em;
}

.icon {
  height: 1.5em;
}

#app-bar {
  animation: $fade-in;
  animation-delay: -0.1s;
  transition-property: box-shadow, padding, height, top;
  transition-duration: 0.5s;
  opacity: 1 !important;
  background-color: var(--v-background-base);
  z-index: 2;
  width: 100vw;
  display: flex;
  align-items: center;
  position: fixed;
  height: 8em;
  padding: 2em;

  .logo {
    height: 100%;

    img {
      height: 100%;
      cursor: pointer;
    }
  }
}
</style>
