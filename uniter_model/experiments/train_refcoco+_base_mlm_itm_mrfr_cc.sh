# horovodrun -np 1 -H localhost:1 \
#     python train_re.py --config config/hps-refcoco+_conceptual.json

horovodrun -np 1 -H localhost:1 \
    python train_re.py \
        --train_txt_db /db/refcoco+_train_base-cased.db \
        --train_img_dir /img/visual_grounding_coco_gt \
        --val_txt_db /db/refcoco+_val_base-cased.db \
        --val_img_dir /img/visual_grounding_coco_gt \
        --checkpoint /pretrain/bert-base_weak_conceptual/ckpt/model_step_200000.pt \
        --cut_bert -1 \
        --output_dir /storage/refcoco+/bert-base_mlm_itm_mrfr_pretrain_cc-refcoco+lr8e-5 \
        --max_txt_len 60 \
        --train_batch_size 128 \
        --val_batch_size 128 \
        --learning_rate 8e-5 \
        --optim adamw \
        --betas 0.9 0.98 \
        --weight_decay 0.01 \
        --dropout 0.1 \
        --grad_norm 2.0 \
        --decay linear \
        --num_train_steps 24000 \
        --warmup_steps 1500 \
        --gradient_accumulation_steps 1 \
        --seed 24 \
        --fp16 
