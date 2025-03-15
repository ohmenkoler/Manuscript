data_COP = readtable('data_DeltaEC_u_opt_COP.txt');
data_COP = data_COP{:,:};
data_Qth = readtable('data_DeltaEC_u_opt_Qth.txt');
data_Qth = data_Qth{:,:};

[COP_max,i_COP_max] = max(data_COP(:,3));
[Qth_max,i_Qth_max] = max(data_Qth(:,3));

mag_u_COP = data_COP(i_COP_max,1)
arg_u_COP = data_COP(i_COP_max,2)
mag_u_Qth = data_Qth(i_Qth_max,1)
arg_u_Qth = data_Qth(i_Qth_max,2)