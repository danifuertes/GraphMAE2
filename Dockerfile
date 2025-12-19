FROM pytorch/pytorch:2.0.1-cuda11.7-cudnn8-runtime

# Working dir
WORKDIR /app

# Install requirements
RUN pip install --upgrade pip
RUN pip install dgl-cu117==0.9.1.post1 -f https://data.dgl.ai/wheels/repo.html
COPY requirements.txt .
RUN pip install -r requirements.txt

# Docker build: docker build -t graph_mae2 .
# Docker run: docker run --gpus all -it --rm -v "$(pwd):/app" graph_mae2 bash
# Run code: python main_full_batch.py --dataset cora --encoder gat --decoder gat --max_epoch 2 --max_epoch_f 2 --device 0 --use_cfg
# Close docker: 'Ctrl + D'
