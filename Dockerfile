FROM pytorch/pytorch:2.0.0-cuda11.7-cudnn8-runtime

# Keep pip up to date (image already includes torch w/ CUDA)
RUN pip install --no-cache-dir --upgrade pip

# Set working directory
WORKDIR /app

# Copy your benchmark script into the container
COPY compute_bench.py /app/compute_bench.py

# Default command to run the script
CMD ["python", "compute_bench.py"]


