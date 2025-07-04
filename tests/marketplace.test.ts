import { Clarinet, Tx, Chain, Account } from 'clarinet';
import { assertEquals } from 'https://deno.land/std@0.148.0/testing/asserts.ts';

Clarinet.test({
  name: "Owner can add a course and user can buy it",
  async fn(chain: Chain, accounts: Map<string, Account>) {
    let deployer = accounts.get('deployer')!;
    let user = accounts.get('wallet_1')!;

    // Owner kurs ekler
    let block = chain.mineBlock([
      Tx.contractCall('courses', 'add-course', [
        { type: 'uint', value: 1 },
        { type: 'string-ascii', value: 'Solidity Basics' },
        { type: 'uint', value: 1000 },
        { type: 'string-ascii', value: 'Learn Solidity' },
      ], deployer.address)
    ]);
    block.receipts[0].result.expectOk().expectBool(true);

    // Kullanıcı kursu satın alır
    block = chain.mineBlock([
      Tx.contractCall('courses', 'buy-course', [
        { type: 'uint', value: 1 }
      ], user.address)
    ]);
    block.receipts[0].result.expectOk().expectBool(true);
  }
});
