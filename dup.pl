n 
nvbm
\\10.188.10.50\Tek_\\10.188.10.50\Tek_HR\\10.188.10.50\Tek_HRHR{
    printf "%8s%4i%4i%8i  %-30s\n",
           $_->{temp}{english},
           $_->{temp}{metric},
           $_->{pop},
           $_->{condition};
}

