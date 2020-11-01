# Makefile for a standalone NS-3 simulation binary.
# Several limitations apply, see the README.
#
# Configure the variables below to customize your build.

PROJECT_NAME = 'simulation'

NS3_DIST = $(shell pwd)/ns3-dist
OUTDIR	= bin
BINARY = $(addprefix $(OUTDIR)/, $(PROJECT_NAME))
INCLUDE	= include
SOURCES	= $(wildcard src/*.cpp src/*.cxx src/*.cc)

CC	= clang++
CXXFLAGS = -Wall -std=c++14 -pedantic -g -DNS_LOG_ENABLE=1
CCOPTS = -fsanitize=address -fno-omit-frame-pointer

.PHONY: out clean

out: $(OUTDIR) $(SOURCES) ns3-dist
	$(CC) $(CCOPTS) $(CXXFLAGS) -o $(BINARY) $(SOURCES) \
		-I$(NS3_DIST)/include/ns3-dev \
		-I$(INCLUDE) \
		-L$(NS3_DIST)/lib64 \
		-lns3-dev-antenna-debug \
		-lns3-dev-aodv-debug \
		-lns3-dev-applications-debug \
		-lns3-dev-bridge-debug \
		-lns3-dev-buildings-debug \
		-lns3-dev-config-store-debug \
		-lns3-dev-core-debug \
		-lns3-dev-csma-debug \
		-lns3-dev-csma-layout-debug \
		-lns3-dev-dsdv-debug \
		-lns3-dev-dsr-debug \
		-lns3-dev-energy-debug \
		-lns3-dev-fd-net-device-debug \
		-lns3-dev-flow-monitor-debug \
		-lns3-dev-internet-apps-debug \
		-lns3-dev-internet-debug \
		-lns3-dev-lr-wpan-debug \
		-lns3-dev-lte-debug \
		-lns3-dev-mesh-debug \
		-lns3-dev-mobility-debug \
		-lns3-dev-mpi-debug \
		-lns3-dev-netanim-debug \
		-lns3-dev-network-debug \
		-lns3-dev-nix-vector-routing-debug \
		-lns3-dev-olsr-debug \
		-lns3-dev-point-to-point-debug \
		-lns3-dev-point-to-point-layout-debug \
		-lns3-dev-propagation-debug \
		-lns3-dev-sixlowpan-debug \
		-lns3-dev-spectrum-debug \
		-lns3-dev-stats-debug \
		-lns3-dev-tap-bridge-debug \
		-lns3-dev-test-debug \
		-lns3-dev-topology-read-debug \
		-lns3-dev-traffic-control-debug \
		-lns3-dev-uan-debug \
		-lns3-dev-virtual-net-device-debug \
		-lns3-dev-wave-debug \
		-lns3-dev-wifi-debug \
		-lns3-dev-wimax-debug

clean:
	-@rm -r $(OUTDIR)

$(OUTDIR):
	@mkdir -p $@

run:
	LD_LIBRARY_PATH='$(LD_LIBRARY_PATH):$(NS3_DIST)/lib64' $(BINARY)

print-% :
	@echo $* = $($*)
