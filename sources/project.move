module MyModule::BasicDEX {

    use aptos_framework::signer;
    use aptos_framework::coin;
    use aptos_framework::aptos_coin::AptosCoin;

    struct LiquidityPool has store, key {
        aptos_reserve: u64,   // Reserve for AptosCoin
        tokenb_reserve: u64,  // Reserve for TokenB
    }

    /// Adds liquidity to the pool, updating the reserves for both tokens.
    public fun add_liquidity(owner: &signer, aptos_amount: u64, tokenb_amount: u64) {
        let pool = LiquidityPool {
            aptos_reserve: aptos_amount,
            tokenb_reserve: tokenb_amount,
        };
        move_to(owner, pool);
    }
}
