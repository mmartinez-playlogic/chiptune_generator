echo "\033[1;35m====================================================="
echo "   🕹️  GENERATING RANDOM TERMINAL CHIPTUNE 🕹️"
echo "   Duration: 3.0 Minutes // Press Ctrl+C to Stop"
echo "=====================================================\033[0m"

# Set total duration to 180 seconds (3 minutes)
end_time=$((SECONDS + 180))

# Array of classic chiptune note frequencies (Pentatonic/Minor scale vibes)
notes=(130.81 146.83 164.81 196.00 220.00 261.63 293.66 329.63 392.00 440.00 523.25 587.33 659.25 783.99 880.00)
wave_types=("square" "triangle" "sawtooth")

while [ $SECONDS -lt $end_time ]; do
    # Pick a random synth wave type for distinct 8-bit textures
    wave=${wave_types[$RANDOM % ${#wave_types[@]}]}
    
    # Pick 4 random notes to create a fast arpeggio loop
    n1=${notes[$RANDOM % ${#notes[@]}]}
    n2=${notes[$RANDOM % ${#notes[@]}]}
    n3=${notes[$RANDOM % ${#notes[@]}]}
    n4=${notes[$RANDOM % ${#notes[@]}]}
    
    # Calculate remaining time
    rem=$((end_time - SECONDS))
    min=$((rem / 60))
    sec=$((rem % 60))
    
    # Flash visual status in terminal
    printf "\r\033[K\033[1;32m[PLAYING]\033[0m Synth: \033[1;36m%-8s\033[0m || Notes: [%.0f, %.0f, %.0f] || Time Left: \033[1;33m%02d:%02d\033[0m" "$wave" "$n1" "$n2" "$n3" "$min" "$sec"
    
    # Play a fast 1.5-second sequence of synthesized chiptune bursts
    play -q -n synth 0.15 $wave $n1 synth 0.15 $wave $n2 synth 0.15 $wave $n3 synth 0.15 $wave $n4 \
             synth 0.15 $wave $n3 synth 0.15 $wave $n2 synth 0.15 $wave $n1 synth 0.15 $wave $n4 2>/dev/null
done

echo -e "\n\n\033[1;35m====================================================="
echo "   🎵 Track Complete. The terminal is quiet again. 🎵"
echo "=====================================================\033[0m"
