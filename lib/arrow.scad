
module arrow()
{
    linear_extrude(height = tb)
    {
        difference()
        {
            polygon(points = [[bpf, 0], [0, bpf], [1 / 2 * bpf, bpf], [bpf / 2, bpf + lpf],
                                [3 * bpf / 2, bpf + lpf], [3 * bpf / 2, bpf], [2 * bpf, bpf]]);
            polygon(points =
                        [[bpf, sqrt(2) * dpf], [sqrt(2) * dpf + dpf, bpf - dpf], [1 / 2 * bpf + dpf, bpf - dpf],
                            [bpf / 2 + dpf, bpf + lpf - dpf], [3 * bpf / 2 - dpf, bpf + lpf - dpf],
                            [3 * bpf / 2 - dpf, bpf - dpf], [2 * bpf - sqrt(2) * dpf - dpf, bpf - dpf]]);
        }
    }
}
