foreach file [glob reports/worst_*_path.mtarpt] {
	read_timing_debug_report -name WORST $file
}
