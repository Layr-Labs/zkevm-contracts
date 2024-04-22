## Update to stable go version to ensure solidity compiled with PUSH0 opcode
## is forward compatible with shanghai EVM version
FROM ethereum/client-go:release-1.13

RUN apk update
RUN apk add --no-cache nginx

RUN nginx -v

COPY docker/entrypoint.sh /usr/local/bin/entrypoint.sh
COPY docker/nginx.conf /etc/nginx/nginx.conf

EXPOSE 8545
EXPOSE 9545

COPY docker/gethData /
COPY docker/deploymentOutput /config/

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

CMD ["--rpc.allow-unprotected-txs", "--http", "--http.addr", "0.0.0.0", "--http.corsdomain", "*", "--http.vhosts", "*", "--ws", "--ws.origins", "*", "--ws.addr", "0.0.0.0", "--dev", "--dev.period", "1", "--datadir", "/geth_data"]
