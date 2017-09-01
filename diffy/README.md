# Diffy

## What is Diffy (https://github.com/twitter/diffy)

Diffy finds potential bugs in your service using running instances of your new code and your old code side by side. Diffy behaves as a proxy and multicasts whatever requests it receives to each of the running instances. It then compares the responses, and reports any regressions that may surface from those comparisons. The premise for Diffy is that if two implementations of the service return “similar” responses for a sufficiently large and diverse set of requests, then the two implementations can be treated as equivalent and the newer implementation is regression-free.

## Why this image

Diffy doesn't return any response. If you want the response you have to put Diffy behind a proxy that duplicates the traffic to Diffy and in the same time forwards the traffic to the origin server.
This image has already configured Duplicator (https://github.com/agnoster/duplicator) and Diffy (https://github.com/twitter/diffy) to work together.

## How to use it

### Available nvironment variable:

* *CANDIDATE*: the host:port of the new webapp to test
* *MASTER_PRIMARY*: the host:port of an old versione of the api
* *MASTER_SECONDARY*: the host:port of an old versione of the api
* *DIFFY_OPT*: the Diffy options. It overrides the default value `-allowHttpSideEffects=true -excludeHttpHeadersComparison=true`

### Exposed ports

* *80*: the Diffy port where the proxy service should listen
* *31149*: the Diffy external HTTP server port
* *31159*: the Diffy admin http server port

Configure a proxy like Charles to forward the desired requests to the diffy proxy port and monitor the request opening with your favourite browser the external server port
