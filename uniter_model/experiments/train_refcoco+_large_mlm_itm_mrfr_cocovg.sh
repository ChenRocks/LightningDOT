# horovodrun -np 1 -H localhost:1 \
#     python train_re.py --config config/hps-refcoco+_conceptual_large_weak.json

horovodrun -np 1 -H localhost:1 \
    python train_re.py \
        --train_txt_db /db/refcoco+_train_large-cased.db \
        --train_img_dir /img/visual_grounding_coco_gt \
        --val_txt_db /db/refcoco+_val_large-cased.db \
        --val_img_dir /img/visual_grounding_det_coco \
        --checkpoint /pretrain/bert-large_weak/ckpt/model_step_50000.pt \
        --cut_bert -1 \
        --output_dir /storage/refcoco+/conceptual-bert-large_mlm+itm+mrfr_pretrain-refcoco+_lr8e-5_b64g4 \
        --max_txt_len 60 \
        --train_batch_size 64 \
        --val_batch_size 256 \
        --learning_rate 8e-5 \
        --optim adamw \
        --betas 0.9 0.98 \
        --weight_decay 0.01 \
        --dropout 0.1 \
        --grad_norm 2.0 \
        --decay linear \
        --num_train_steps 24000 \
        --warmup_steps 1500 \
        --gradient_accumulation_steps 4 \
        --seed 24 \
        --mlp 1 \
        --fp16