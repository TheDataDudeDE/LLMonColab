curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
/root/.cargo/bin/rustup component add rust-src


pip install -q condacolab

python -c "import condacolab;condacolab.install()"

conda init bash
conda create -n text-generation-inference python=3.9
conda activate text-generation-inference

git clone https://github.com/huggingface/text-generation-inference.git && cd text-generation-inference
BUILD_EXTENSIONS=True make install

sudo apt-get install libssl-dev gcc -y

text-generation-launcher --model-id tiiuae/falcon-7b-instruct --max-total-tokens 1024 --max-batch-prefill-tokens 2048   --max-input-length 512

curl 127.0.0.1:3000/generate \
    -X POST \
    -d '{"inputs":"Was ist der Sinn des Lebens","parameters":{"max_new_tokens":20}}' \
    -H 'Content-Type: application/json'



